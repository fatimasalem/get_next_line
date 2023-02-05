/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fsalem <fsalem@student.42abudhabi.ae>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/01 11:21:19 by fsalem            #+#    #+#             */
/*   Updated: 2023/02/03 06:03:25 by fsalem           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

char	*ft_get_line(char *str)
{
	int		i;
	char	*left_str;

	i = 0;
	if (!str[i])
		return (NULL);
	while (str[i] && str[i] != '\n')
		i++;
	left_str = (char *)malloc(sizeof(char) * (i + 2));
	if (!left_str)
		return (NULL);
	i = 0;
	while (str[i] && str[i] != '\n')
	{
		left_str[i] = str[i];
		i++;
	}
	if (str[i] == '\n')
	{
		left_str[i] = str[i];
		i++;
	}
	left_str[i] = '\0';
	return (left_str);
}

char	*ft_save(char *save)
{
	int		i;
	int		j;
	char	*new_str;

	i = 0;
	while (save[i] && save[i] != '\n')
		i++;
	if (!save[i] || (save[i] == '\n' && !save[i + 1]))
	{
		free(save);
		return (NULL);
	}
	new_str = (char *)malloc(sizeof(char) * (ft_strlen(save) - i + 1));
	if (!new_str)
		return (NULL);
	i++;
	j = 0;
	while (save[i])
		new_str[j++] = save[i++];
	new_str[j] = '\0';
	free(save);
	return (new_str);
}

char	*ft_read(int fd, char *str)
{
	int		ret;
	char	*buf;

	buf = (char *)malloc(sizeof(char) * (BUFFER_SIZE + 1));
	if (!buf)
		return (NULL);
	ret = 1;
	while (!ft_strchr(str, '\n') && ret != 0)
	{
		ret = read(fd, buf, BUFFER_SIZE);
		if (ret == -1)
		{
			free(buf);
			return (NULL);
		}
		buf[ret] = '\0';
		str = ft_strjoin(str, buf);
	}
	free(buf);
	return (str);
}

char	*get_next_line(int fd)
{
	static char	*str;
	char		*line;

	if (fd < 0 || BUFFER_SIZE <= 0)
		return (0);
	str = ft_read(fd, str);
	if (!str)
		return (0);
	line = ft_get_line(str);
	str = ft_save(str);
	return (line);
}

int	main(void)
{
	int	fd = 0;
	char *str;
	char *line;

	str = NULL;
	fd = open("fd.txt", O_RDONLY);
	line = get_next_line(fd);
	while (line)
	{
		str = ft_strjoin(str, line);
		free(line);
		line = get_next_line(fd);
	}
	printf("Size: [%lu]\n\nContent:\n%s\n", strlen(str), str);
	free(str);
}

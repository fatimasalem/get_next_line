/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_bonus.h                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fsalem <fsalem@student.42abudhabi.ae>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/19 11:04:05 by fsalem            #+#    #+#             */
/*   Updated: 2023/02/02 11:31:29 by fsalem           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GET_NEXT_LINE_BONUS_H
# define GET_NEXT_LINE_BONUS_H
# define BUFFER_SIZE 9999

# include <unistd.h>
# include <string.h>
# include <stdlib.h>
# include <stdio.h>
# include <fcntl.h>

char	*ft_strjoin(char *s1, char *s2);
int		ft_strlen(char *s);
char	*ft_strchr(char *s, int c);
char	*ft_save(char *save);
char	*get_next_line(int fd);
char	*ft_read(int fd, char *str);
char	*ft_get_line(char *str);

#endif
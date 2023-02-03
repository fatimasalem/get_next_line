# -------------------NAME_M, Bonus Executions-------------------#

NAME_M		=	gnl
NAME_B		=	gnl_bonus

# -------------------Compiling-------------------#

CC			=	gcc -I $(INC_DIR)

# -------------------C Flags-------------------#

CFLAGS		=	-Werror -Wall -Wextra

# -------------------Control-------------------#

RESET		=	\033[0m
GREEN		=	\033[32m
YELL		=	\033[33m
BLUE		=	\033[34m
RED			=	\033[31m
UP			=	\033[A
CUT			=	\033[K

# -------------------NAME_M, Bonus, Include Dir-------------------#

OBJ_DIR		=	Mandatory/obj
SRC_DIR		=	Mandatory/src
B_ODIR		=	Bonus/obj
B_SDIR		=	Bonus/src
INC_DIR		=	Includes/

# -------------------Mandatory, Bonus and Include Files-------------------#

M_FILES		=	get_next_line.c \
				get_next_line_utils.c
B_FILES		=	get_next_line_bonus.c \
				get_next_line_utils_bonus.c
INC_FILE	=	get_next_line.h \
				get_next_line_bonus.h


OBJ			=	$(addprefix $(OBJ_DIR)/, $(M_FILES:%.c=%.o))
SRC			=	$(addprefix $(SRC_DIR)/, $(M_FILES))
OBJBONUS	=	$(addprefix $(B_ODIR)/, $(B_FILES:%.c=%.o))
SRCBONUS	=	$(addprefix $(B_SDIR)/, $(B_FILES))
INCLUDES	=	$(addprefix $(INC_DIR)/, $(INC_FILE))

all: layout mkdir includes obj src obj_bonus src_bonus tests

layout:
	@printf "\n"
	@echo "$(YELL)         _                  _      _ _         $(RESET)"
	@echo "$(YELL) ___ ___| |_    ___ ___ _ _| |_   | |_|___ ___ $(RESET)"
	@echo "$(BLUE)| . | -_|  _|  |   | -_|_'_|  _|  | | |   | -_|$(RESET)"
	@echo "$(YELL)|_  |___|_|    |_|_|___|_,_|_|    |_|_|_|_|___|$(RESET)"
	@echo "$(YELL)|___|                                          $(RESET)"
	@printf "\n"

mkdir:
	@mkdir	-p	$(OBJ_DIR)
	@mkdir	-p	$(SRC_DIR)
	@mkdir	-p	$(B_ODIR)
	@mkdir	-p	$(B_SDIR)
	@mkdir	-p	$(INC_DIR)

# -------------------Mandatory-------------------#

obj: $(NAME_M)
$(NAME_M):	$(OBJ)
	@$(CC) $(CFLAGS) $(OBJ) -o $@

$(OBJ_DIR)%.o : $(SRC_DIR)%.c
	@$(CC) $(CFLAGS) -I $(INC_DIR) -c  $< -o $@

src:	$(SRC)
$(SRC_DIR)/$(M_FILES):
	@mv $(M_FILES) $(SRC_DIR) 2>/dev/null
	@cp -f $(INC_DIR)/get_next_line.h $(SRC_DIR) 2>/dev/null

# -------------------Bonus-------------------#

obj_bonus:	$(NAME_B)
$(NAME_B):	$(OBJBONUS)
	@$(CC) $(CFLAGS) $(OBJBONUS) -o $@

$(B_ODIR)%.o : $(B_SDIR)%.c
	@$(CC) $(CFLAGS) -I $(INC_DIR) -c $< -o $@

src_bonus:	$(SRCBONUS)
$(B_SDIR)/$(B_FILES):
	@mv $(B_FILES) $(B_SDIR) 2>/dev/null
	@cp -f $(INC_DIR)/get_next_line_bonus.h $(B_SDIR) 2>/dev/null

# -------------------Includes-------------------#

includes:	$(INCLUDES)
$(INC_DIR)/$(INC_FILE):
	@mv $(INC_FILE) ./Includes 2>/dev/null

# -------------------Tests-------------------#
tests:
	@if [ ! -d "$(SRC_DIR)/*.txt" ]; then touch fd.txt fd1.txt fd2.txt; \
	echo "Hello World" | tee *.txt >/dev/null; cp fd.txt $(SRC_DIR); fi
	@mv *.txt $(B_SDIR) 2>/dev/null
	@mv $(NAME_M) ./$(OBJ_DIR) 2>/dev/null
	@mv $(NAME_B) ./$(B_ODIR) 2>/dev/null

# -------------------Clean-------------------#

clean:
	@rm -rf $(OBJ_DIR)
	@rm -rf $(B_ODIR)

# -------------------Fclean-------------------#
fclean:		clean
	@rm -rf $(NAME_M)
	@rm -rf $(NAME_B)
	@if [ -d "./Mandatory" ]; then mv $(SRC_DIR)/*.c . 2>/dev/null;rm -rf Mandatory; fi
	@if [ -d "./Bonus" ]; then mv $(B_SDIR)/*.c . 2>/dev/null; rm -rf Bonus; fi
	@if [ -d "./Includes" ]; then mv $(INC_DIR)/*.h . 2>/dev/null; rm -rf ./Includes; fi
re:		fclean all

.PHONY:	re fclean all clean mkdir includes obj src obj_bonus src_bonus tests layout
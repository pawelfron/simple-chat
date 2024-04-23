CC := gcc
CFLAGS := -Wall -Wextra -pedantic
LDFLAGS := -lm

# Name of the final executable
NAME := app

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

all: dir app

dir:
	mkdir -p $(OBJ_DIR) $(BIN_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

app: $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $(BIN_DIR)/$(NAME)

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

.PHONY: all clean

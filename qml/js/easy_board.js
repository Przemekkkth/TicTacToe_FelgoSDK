// Set up the game board. It is 1x1
const board = [
  ['']
];

// Initialize current player and number of moves
let currentPlayer = 'X';
let moves = 0;

// Check if there's a winner
function checkWinner() {
  if(board[0][0])
  {
      return board[0][0];
  }

  // No winner yet
  return null;
}

function reset(){
    board[0][0] = '';
}

function getText(row, col)
{
    if(board[row][col])
    {
       return board[row][col];
    }
    return '';
}

// Handle a move
function handleMove(row, col) {
  // Check if the cell is empty
  if (!board[row][col]) {
    // Update the board
    board[row][col] = currentPlayer;
    }
}

function isRunning(){
    const winner = checkWinner();
    if (winner) {
        return false;
    }
}


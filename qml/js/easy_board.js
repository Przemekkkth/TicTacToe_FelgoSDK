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

    // Check if there's a winner
    const winner = checkWinner();
    if (winner) {
      // Game over
      console.log(`${winner} wins!`);
    } else {
      // Switch player
      currentPlayer = currentPlayer === 'X' ? 'O' : 'X';
      moves++;
      console.log(`It's ${currentPlayer}'s turn.`);
    }
  } else {
    console.log('This cell is already occupied. Choose another one.');
  }
}

function isRunning(){
    const winner = checkWinner();
    if (winner) {
        return false;
    }
}

// Start the game
console.log(`It's ${currentPlayer}'s turn.`);
//handleMove(0, 0); // Make a move at (0, 0)

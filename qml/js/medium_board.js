// Set up the game board
const board = [
  ['', '', ''],
  ['', '', ''],
  ['', '', '']
];

// Initialize player and PC
let player = 'X';
let pc = 'O';
let moves = 0;

// Set initial value
function reset(){
    for(let row = 0; row < 3; ++row)
    {
        for(let column = 0; column < 3; ++column)
        {
            board[row][column] = '';
        }
    }
    moves = 0;
}

// Check board piece is free
function isEmptyPiece(index){
    var row = Math.floor(index / 3);
    var col = index % 3;
    if(board[row][col] === '')
    {
        return true;
    }
    return false;
}

// Check if there's a winner
function checkWinner() {
  // Check rows
  for (let row = 0; row < 3; row++) {
    if (board[row][0] && board[row][0] === board[row][1] && board[row][1] === board[row][2]) {
      return board[row][0] + " wins";
    }
  }

  // Check columns
  for (let col = 0; col < 3; col++) {
    if (board[0][col] && board[0][col] === board[1][col] && board[1][col] === board[2][col]) {
      return board[0][col] + " wins";
    }
  }

  // Check diagonals
  if (board[0][0] && board[0][0] === board[1][1] && board[1][1] === board[2][2]) {
    return board[0][0] + " wins";
  }

  if (board[0][2] && board[0][2] === board[1][1] && board[1][1] === board[2][0]) {
    return board[0][2] + " wins";
  }

  // Check if there's a tie
  if (moves === 9) {
    return 'Tie';
  }

  // No winner yet
  return null;
}

// Count elements
function countOf(element)
{
    let retVal = 0;
    for(let row = 0; row < 3; ++row)
    {
        for(let column = 0; column < 3; ++column)
        {
            if(board[row][column] === element)
            {
                ++retVal;
            }
        }
    }

    return retVal;
}

// Handle player move
function playerMove(index) {
    var row = Math.floor(index / 3);
    var col = index % 3;
  // Check if the cell is empty
  if (!board[row][col]) {
    // Update the board
    board[row][col] = player;
    moves++;
  }
}

// Handle PC move
function pcMove() {
  // Choose a random empty cell
  let emptyCells = [];
  for (let row = 0; row < 3; row++) {
    for (let col = 0; col < 3; col++) {
      if (!board[row][col]) {
        emptyCells.push([row, col]);
      }
    }
  }

  if (emptyCells.length > 0) {
    const [row, col] = emptyCells[Math.floor(Math.random() * emptyCells.length)];
    // Update the board
    board[row][col] = pc;
    // Increment a moves
    moves++
    const retVal = (3*row)+col;
    return retVal;
  }
}


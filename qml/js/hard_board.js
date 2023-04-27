// Set up the game board
const board = [
  ['', '', '', '', ''],
  ['', '', '', '', ''],
  ['', '', '', '', ''],
  ['', '', '', '', ''],
  ['', '', '', '', '']
];

// Initialize player and PC
let player = 'X';
let pc = 'O';
let moves = 0;
const size = 5;

// Set initial value
function reset(){
    for(let row = 0; row < size; ++row)
    {
        for(let column = 0; column < size; ++column)
        {
            board[row][column] = '';
        }
    }
    moves = 0;
}

// Check board piece is free
function isEmptyPiece(index){
    var row = Math.floor(index / size);
    var col = index % size;
    if(board[row][col] === '')
    {
        return true;
    }
    return false;
}

// Check if there's a winner
function checkWinner() {
    // Check rows
    for (let i = 0; i < 5; i++) {
      for (let j = 0; j < 2; j++) {
        if (
          board[i][j] === board[i][j+1] &&
          board[i][j+1] === board[i][j+2] &&
          board[i][j+2] === board[i][j+3] &&
          (board[i][j] === 'X' || board[i][j] === 'O')
        ) {
          return board[i][j] + " wins";
        }
      }
    }

    // Check columns
    for (let i = 0; i < 2; i++) {
      for (let j = 0; j < 5; j++) {
        if (
          board[i][j] === board[i+1][j] &&
          board[i+1][j] === board[i+2][j] &&
          board[i+2][j] === board[i+3][j] &&
          (board[i][j] === 'X' || board[i][j] === 'O')
        ) {
          return board[i][j] + " wins";
        }
      }
    }

    // Check diagonal from top left to bottom right
    for (let i = 0; i < 2; i++) {
      for (let j = 0; j < 2; j++) {
        if (
          board[i][j] === board[i+1][j+1] &&
          board[i+1][j+1] === board[i+2][j+2] &&
          board[i+2][j+2] === board[i+3][j+3] &&
          (board[i][j] === 'X' || board[i][j] === 'O')
        ) {
          return board[i][j] + " wins";
        }
      }
    }

    // Check diagonal from top right to bottom left
    for (let i = 0; i < 2; i++) {
      for (let j = 3; j < 5; j++) {
        if (
          board[i][j] === board[i+1][j-1] &&
          board[i+1][j-1] === board[i+2][j-2] &&
          board[i+2][j-2] === board[i+3][j-3] &&
          (board[i][j] === 'X' || board[i][j] === 'O')
        ) {
          return board[i][j] + " wins";
        }
      }
    }


  // Check if there's a tie
  if (moves === size*size) {
    return 'Tie';
  }

  // No winner yet
  return null;
}

// Count elements
function countOf(element)
{
    let retVal = 0;
    for(let row = 0; row < size; ++row)
    {
        for(let column = 0; column < size; ++column)
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
    var row = Math.floor(index / size);
    var col = index % size;
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
  for (let row = 0; row < size; row++) {
    for (let col = 0; col < size; col++) {
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
    const retVal = (size*row)+col;
    return retVal;
  }
}


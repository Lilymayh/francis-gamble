document.addEventListener('DOMContentLoaded', () => {

  const X_CLASS = 'x';

  const CIRCLE_CLASS = 'circle';

  const WINNING_COMBINATIONS = [

    [0, 1, 2],

    [3, 4, 5],

    [6, 7, 8],

    [0, 3, 6],

    [1, 4, 7],

    [2, 5, 8],

    [0, 4, 8],

    [2, 4, 6]

  ];

  const cellElements = document.querySelectorAll('[data-cell]');

  const boardElement = document.getElementById('board');

  const winningMessageElement = document.getElementById('winningMessage');

  const restartButton = document.getElementById('restartButton');

  const winningMessageTextElement = document.querySelector('[data-winning-message-text]');



  let circleTurn = false;



  startGame();



  restartButton.addEventListener('click', startGame);



  function startGame() {

    circleTurn = false;

    cellElements.forEach(cell => {

      cell.classList.remove(X_CLASS, CIRCLE_CLASS);

      cell.removeEventListener('click', handleClick);

      cell.addEventListener('click', handleClick, { once: true });

    });

    setBoardHoverClass();

    winningMessageElement.classList.remove('show');

  }



  function handleClick(e) {

    const cell = e.target;

    if (!circleTurn) {  // Player's turn (X)

      const index = cell.dataset.index;

      placeMark(cell, X_CLASS);



      console.log("Player clicked. Mark placed at index:", index);



      fetch(`/tictactoe/${boardElement.dataset.gameId}`, {

        method: 'PATCH',

        headers: {

          'Content-Type': 'application/json',

          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content

        },

        body: JSON.stringify({ tictactoe: { index: index } })

      }).then(response => response.json()).then(data => {

        if (data.error) {

          console.error(data.error);

        } else {

          console.log("Server update returned. Updating board from server...");
setTimeout(() => {
          updateBoardFromServer(data.board);
}, 1000)
          const gameStatus = checkGameStatus(X_CLASS);

          if (gameStatus === 'win') {

            endGame(false);

          } else if (gameStatus === 'draw') {

            endGame(true);

          } else {

            setTimeout(() => {

              console.log("Your move...");

              //enemyMove()

            }, 500);

          }

        }

      });

    }

  }



  function enemyMove() {

    const availableCells = Array.from(cellElements).filter(cell => !cell.classList.contains(X_CLASS) && !cell.classList.contains(CIRCLE_CLASS));

    if (availableCells.length === 0) {

      return;

    }

    const randomCell = availableCells[Math.floor(Math.random() * availableCells.length)];

    placeMark(randomCell, CIRCLE_CLASS);



    console.log("Opponent placed mark at random cell.");



    const gameStatus = checkGameStatus(CIRCLE_CLASS);

    if (gameStatus === 'win') {

      endGame(false);

    } else if (gameStatus === 'draw') {

      endGame(true);

    } else {

      swapTurns();  // Player's turn again

    }

  }



  function endGame(draw) {

    if (draw) {

      winningMessageTextElement.innerText = 'Draw!';

    } else {

      winningMessageTextElement.innerText = `${circleTurn ? "O's" : "X's"} Wins!`;

    }

    winningMessageElement.classList.add('show');

  }



  function checkGameStatus(currentClass) {

    if (checkWin(currentClass)) {

      return 'win';

    } else if (isDraw()) {

      return 'draw';

    } else {

      return 'ongoing';

    }

  }



  function isDraw() {

    return [...cellElements].every(cell => {

      return cell.classList.contains(X_CLASS) || cell.classList.contains(CIRCLE_CLASS);

    });

  }



  function placeMark(cell, currentClass) {

    cell.classList.add(currentClass);

  }



  function swapTurns() {

    circleTurn = !circleTurn;

    console.log("Turn swapped. Current turn:", circleTurn ? "O's turn" : "X's turn");

    setBoardHoverClass();

  }



  function setBoardHoverClass() {

    boardElement.classList.remove(X_CLASS, CIRCLE_CLASS);

    if (circleTurn) {

      boardElement.classList.add(CIRCLE_CLASS);

    } else {

      boardElement.classList.add(X_CLASS);

    }

    console.log("Hover class set. Current turn:", circleTurn ? "O's turn" : "X's turn");

  }



  function checkWin(currentClass) {

    return WINNING_COMBINATIONS.some(combination => {

      return combination.every(index => {

        return cellElements[index].classList.contains(currentClass);

      });

    });

  }



  function updateBoardFromServer(board) {

    board.forEach((mark, index) => {

      const cell = cellElements[index];

      cell.classList.remove(X_CLASS, CIRCLE_CLASS);

      if (mark === 'X') {

        cell.classList.add(X_CLASS);

      } else if (mark === 'O') {

        cell.classList.add(CIRCLE_CLASS);

      }

    });

    //swapTurns(); // Ensure that after updating the board, the turn is correctly swapped

  }

});
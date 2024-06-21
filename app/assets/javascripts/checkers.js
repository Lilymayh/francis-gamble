document.addEventListener('DOMContentLoaded', () => {
  const squares = document.querySelectorAll('.square');
  let selectedSquare = null;
  console.log("successfully initialized");

  squares.forEach(square => {
    square.addEventListener('click', (event) => {
      const clickedSquare = event.target.closest('.square');

      if (!selectedSquare) {
        // Check if the clicked square contains a piece
        const piece = clickedSquare.querySelector('.piece');
        if (piece) {
          selectedSquare = clickedSquare;
          console.log('Selected square', selectedSquare.dataset);
        }
        return; // Early return if no piece is selected
      }

      const destinationSquare = clickedSquare;

     // Ensure selectedSquare is not the same as destinationSquare
     if (selectedSquare === destinationSquare) {
      console.log('Selected the same square');
      selectedSquare = null;
      return;
    }

      const piece = selectedSquare.querySelector('.piece');

      // Validate the move
      if (!piece || !validMove(selectedSquare, destinationSquare, piece)) {
        console.log('Invalid move');
        selectedSquare = null; // Reset selection if move is invalid
        return;
      }

      // Move the piece
      movePiece(selectedSquare, destinationSquare);
      selectedSquare = null; // Reset selection after moving the piece
    });
  });

  function movePiece(sourceSquare, destinationSquare) {
    const piece = sourceSquare.querySelector('.piece');
    if (piece) {
      destinationSquare.appendChild(piece);
      console.log('Piece moved from', sourceSquare.dataset, 'to', destinationSquare.dataset);
    }


  }

  function validMove(sourceSquare, destinationSquare, piece) {
    // Extracting row and column information from dataset attributes
    const sourceRow = parseInt(sourceSquare.dataset.row);
    const sourceCol = parseInt(sourceSquare.dataset.col);
    const destRow = parseInt(destinationSquare.dataset.row);
    const destCol = parseInt(destinationSquare.dataset.col);

      const direction = "black" ? 1 : -1;    

    // Calculating row and column differences
    const rowDiff = Math.abs(destRow - sourceRow);
    const colDiff = Math.abs(destCol - sourceCol);

    // Check if the destination square is a valid diagonal move
    if ((rowDiff !== direction || colDiff !== 1)) return false;

    return true;
  }
});
document.addEventListener('DOMContentLoaded', () => {
  const squares = document.querySelectorAll('.square');
  let selectedSquare = null;
  console.log("successfully initialized");

  squares.forEach(square => {
    square.addEventListener('click', (event) => {        
      const clickedSquare = event.target.closest('.square');
      console.log('click', event.target);
      console.log(clickedSquare.dataset);

      if (!selectedSquare) {
        selectedSquare = clickedSquare;
        console.log('Selected square', selectedSquare.dataset);
      } else {
        const destinationSquare = clickedSquare;
        console.log('Moving piece from', selectedSquare.dataset, 'to', destinationSquare.dataset);

        if (validMove(selectedSquare, destinationSquare)) {
          movePiece(selectedSquare, destinationSquare);
          selectedSquare = null;
        } else {
          console.log('Invalid move');
        }
      }
    });
  });

  function movePiece(sourceSquare, destinationSquare) {
    if (sourceSquare && destinationSquare && sourceSquare !== destinationSquare) {
      const piece = sourceSquare.querySelector('.piece');
      if (piece) {
        destinationSquare.appendChild(piece);
        console.log('Piece moved from', sourceSquare.dataset, 'to', destinationSquare.dataset);
      }
    }
  }
  
  function validMove(sourceSquare, destinationSquare) {
    // Extracting row and column information from dataset attributes
    const sourceRow = parseInt(sourceSquare.dataset.row);
    const sourceCol = parseInt(sourceSquare.dataset.col);
    const destRow = parseInt(destinationSquare.dataset.row);
    const destCol = parseInt(destinationSquare.dataset.col);

    // Selecting the piece in the source square
    const piece = sourceSquare.querySelector('.piece');
    if (!piece) return false;

    // Determining the color of the piece
    const color = piece.dataset.piece;
    // Adjusting direction of movement based on color
    const direction = (color === "black") ? 1 : -1;

    // Calculating row and column differences
    const rowDiff = Math.abs(destRow - sourceRow);
    const colDiff = Math.abs(destCol - sourceCol);

    // Calculating the row and column of the potentially captured piece
    const capturedRow = (sourceRow + destRow) / 2;
    const capturedCol = (sourceCol + destCol) / 2;

    // Check if destination square is empty
    if (destinationSquare.querySelector('.piece')) return false;

    // Check if source and destination squares are the same
    if (sourceSquare === destinationSquare) return false;

    // Check if piece is moving in the correct direction
    if (!piece.classList.contains('king') && (direction * (destRow - sourceRow)) <= 0) return false;

    // Check if the destination square is a valid diagonal move
    if ((rowDiff !== 1 || colDiff !== 1)) return false;

    // Check if the destination square is of the opposite color
    if ((sourceSquare.classList.contains('white') && destinationSquare.classList.contains('black')) ||
        (sourceSquare.classList.contains('black') && destinationSquare.classList.contains('white'))) {
      return true;
    }
    // If none of the conditions are met, return false
    return false;
  }
});
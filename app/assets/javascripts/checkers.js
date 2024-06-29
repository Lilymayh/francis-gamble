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

  function promoteToKing(piece, destRow, pieceColor) {
    const backRow = pieceColor === 'black' ? 1 : 8;

    if (destRow === backRow) {
      piece.classList.add('king');
      console.log(`Piece promoted to king at row ${destRow}`);
    }
  }

  function validMove(sourceSquare, destinationSquare, piece) {
    // Extracting row and column information from dataset attributes
    const sourceRow = parseInt(sourceSquare.dataset.row);
    const sourceCol = parseInt(sourceSquare.dataset.col);
    const destRow = parseInt(destinationSquare.dataset.row);
    const destCol = parseInt(destinationSquare.dataset.col);

    // Calculating row and column differences
    const rowDiff = destRow - sourceRow;
    const colDiff = Math.abs(destCol - sourceCol);

    // Determine direction based on piece color
    const pieceColor = piece.classList.contains('black') ? 'black' : 'red';
    const direction = pieceColor === 'black' ? 1 : -1;

    // Log move details for debugging
    console.log(`Attempting move from (${sourceRow}, ${sourceCol}) to (${destRow}, ${destCol})`);
    console.log(`Piece color: ${pieceColor}, Direction: ${direction}`);
    console.log(`Row diff: ${rowDiff}, Col diff: ${colDiff}`);

    const isKing = piece.classList.contains('king');

    // 'rowDiff === -direction' ensures the pieces move diagonally and prevents them from moving backwards if not king
    if (Math.abs(rowDiff) === 1 && colDiff === 1 && (isKing || rowDiff === -direction)) {
      promoteToKing(piece, destRow, pieceColor);
      return true;
    }

    // Check for capturing move 
    if (Math.abs(rowDiff) === 2 && colDiff === 2) {
      const middleRow = (sourceRow + destRow) / 2;
      const middleCol = (sourceCol + destCol) / 2;

      const middleSquare = document.querySelector(`.square[data-row="${middleRow}"][data-col="${middleCol}"]`);
      const middlePiece = middleSquare.querySelector('.piece');

      // Check for middle piece & piece color
      if (middlePiece && !middlePiece.classList.contains(pieceColor)) {
        middleSquare.removeChild(middlePiece);
        return true;
      }

      if (Math.abs(rowDiff) === 4 && colDiff === 4) {
        const middleRow1 = sourceRow + (destRow - sourceRow) / 2;
        const middleCol1 = sourceCol + (destCol - sourceCol) / 2;
        const middleRow2 = sourceRow + 3 * (destRow - sourceRow) / 4;
        const middleCol2 = sourceCol + 3 * (destCol - sourceCol) / 4;
    
        const middleSquare1 = document.querySelector(`.square[data-row="${middleRow1}"][data-col="${middleCol1}"]`);
        const middleSquare2 = document.querySelector(`.square[data-row="${middleRow2}"][data-col="${middleCol2}"]`);
        const middlePiece1 = middleSquare1.querySelector('.piece');
        const middlePiece2 = middleSquare2.querySelector('.piece');
    
        if (middlePiece1 && middlePiece2 && !middlePiece1.classList.contains(pieceColor) && !middlePiece2.classList.contains(pieceColor)) {
            middleSquare1.removeChild(middlePiece1);
            middleSquare2.removeChild(middlePiece2);
            promoteToKing(piece, destRow, pieceColor);
            console.log("Double capture performed");
            return true;
        }
    }
    }
    // If none, the move is invalid
    return false;
  }
});
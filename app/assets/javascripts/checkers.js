document.addEventListener('DOMContentLoaded', () => {
  const squares = document.querySelectorAll('.square');
  let selectedSquare = null;
	console.log("successfull")

    squares.forEach(square => {
      square.addEventListener('click', (event) => {        
        const clickedSquare = event.target.closest('.square');

			console.log('click', event.target);
      console.log(square.dataset)

      if (selectedSquare) {
        const destinationSquare = clickedSquare;
        console.log('Moving piece from', selectedSquare.dataset, 'to', destinationSquare.dataset);

        movePiece(selectedSquare, destinationSquare);
        selectedSquare = null;
      }
    });
  })
})

//     piece.addEventListener('dragover', (event) => {
//       event.preventDefault();
//     });

// 		piece.addEventListener('drop', async (event) => {
//       event.preventDefault();
//       const id = event.dataTransfer.getData('text/plain');
//       const draggedElement = document.getElementById(id);
//       const targetElement = event.target.closest('.square');

// 			//Validate move
//       if (draggedElement && targetElement) {
//         const sourceSquareId = draggedElement.closest('.square').dataset.squareId;
//         const destinationSquareId = targetElement.dataset.squareId;

//         try {
//           const response = await fetch('/pieces/validate_move', {
//             method: 'POST',
//             headers: {
//               'Content-Type': 'application/json',
//               'X-CSRF-Token': Rails.csrfToken()
//             },
//             body: JSON.stringify({ source_square_id: sourceSquareId, destination_square_id: destinationSquareId })
//           });

//           const data = await response.json();
//           if (data.valid) {
//             targetElement.appendChild(draggedElement);
//           } else {
//             console.log('Invalid move');
//           }
//         } catch (error) {
//           console.error('Error:', error);
//         }
//       }
//     });

//     piece.addEventListener('dragend', (event) => {
//       const id = event.dataTransfer.getData('text/plain');
//       const draggedElement = document.getElementById(id);
//       if (draggedElement) {
//         draggedElement.removeAttribute('data-dnd-id');
//       }
//     });

//     piece.draggable = true;
//   });
// });
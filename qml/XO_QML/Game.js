.pragma library

var board = [["-","-","-"],["-","-","-"],["-","-","-"]];

var turn = 0;
var callback;
function init(root, wn){
    callback = wn;
    for(var x = 0; x< 3; x++){
        for(var y=0;y<3;y++){
            var cell = Qt.createComponent("Cell.qml");
            var cellObject = cell.createObject(root ,{"x":x*200 , "y":y*200});
            board[x][y] = cellObject;
        }
    }
}

function checkWin(){
    for(var x =0 ; x< 3;x++){
        if(board[x][0].chosen === board[x][1].chosen && board[x][1].chosen === board[x][2].chosen && board[x][2].chosen !== "")
            callback();

        var y = x;
        if(board[0][y].chosen === board[1][y].chosen && board[1][y].chosen === board[2][y].chosen && board[2][y].chosen !== "")
            callback();
    }


    if((board[0][0].chosen === board[1][1].chosen && board[1][1].chosen === board[2][2].chosen && board[2][2].chosen !== "")
      ||(board[2][0].chosen === board[1][1].chosen && board[1][1].chosen === board[0][2].chosen && board[0][2].chosen !== ""))
            callback();
}

function DestroyGameBoard(){
    for(var x = 0; x< 3; x++){
        for(var y=0;y<3;y++){
            board[x][y].destroy();
        }
    }
}

//Create list of ints from 1 to 5, Haskell equivalent [1..5]
function arrFunc(){
    let arr = [];
    let a = 5;
    let b = 10;
    for (let i = a; i<=b; i++) {
        arr.push(i);
    }
    return arr;    
}

function applicatorFunc(inpFunc, s){
    if(s=='s'){
        const arr = inpFunc();        
        let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
        return sum;
    }
    else{        
        const arr = inpFunc();
        let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
        return sum/(b-a);
    }
}

let x = applicatorFunc(arrFunc, 's');
console.log(x);
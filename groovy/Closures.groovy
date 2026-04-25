 // traditional app

 def sum (n){
    t = 0
    for(int i = 2; i <= n; i++){
        t+=i
    }

    //return t
    t
}


def product(n){
    p = 1
    for(int i = 2; i <= n; i += 2){
        p *= i
    }
    p
}

// println sum(2)

// println product(5)


// closures - block of code | variable block holds the reference to closure(code).

def printNumbs(n , block){

    for(int i = 1; i <=n; i++){
        block(i)
    }

}

// printNumbs(5 , {println it})

// printNumbs(5 , {println "------${it}------"})


def selectTotal(n , closure){
    t = 0
    for(i in 1..n){
        if(closure(i)) t += i
    }
    t
}

// println selectTotal(15,{it % 5 == 0})



class Equipment{
    def calculator

    Equipment(calc) { calculator = calc }


    def simulate(){
        println "Started Simulations"
        calculator()
    }
}




eq1 = new Equipment({ println "Calculator 1" })

aCalculator = {println "calculator 2"}

// eq1.simulate()

eq2 = new Equipment(aCalculator)

// eq2.simulate()

// "it" is the default name to pass single parameter 



def tellFortune(closure){
    closure Date.parse("dd/MM/yyyy", "20/04/2026") , "hey , how you doing"
}

// tellFortune(){
// }



def iterate(n , closure){
    1.upto(n){
        println "In Iterate with value ${it}"
    }
}


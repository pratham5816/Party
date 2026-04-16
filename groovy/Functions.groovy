def max(x,y){
    return Math.max(x,y)
}


def hello(a ="hey", b ="hotwax systems" , c = "hotwax commerce"){

    println a
    println b
    println c
}

println max(10,2)

// optional parameters   if parameters are already defined in method then its optional to pass.

hello()

hello("hi" , "MORGEN")



def fun(name , String[] details){
    println "$name - $details"
}


fun("pratham" , "883" , "968" ,"123" , "indore")



def callMe(a , ...b){
    println "A : ${a} || B : ${b}"
}


callMe("hi" , "hotwax" , "System" , "commerce")


def guessNum(x){
    x == 100 
}

println(guessNum(22))
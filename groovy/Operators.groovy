update-java-alternatives -lSassert 1 + 2 == 3

//assert 1 == 2

assert 2.2.plus(1.3) == 3.5

def i = 10

println(i++)
println(++i)

assert true == true

assert (!false && false) == false

println Integer.toBinaryString(11)

def output = (1>0) ? "true" : "false"

println output

if(output == "true") {
    println "yes"
}else{
    println "no"
}

def x = 2
switch (x){
    case 1:
        println "number is 1"
        break
    case 2:
        println "number is 2"
        break
    case 3:
        println "number is 3"
        break
    case {x < 10}:
        println "valid"
        break
    default:
        println "invalid"
}
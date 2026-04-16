enum CoffeeSize {SHORT , SMALL , MEDIUM , LARGE}


def orderCoffee(size){

    println "Coffee in making for size ${size}"


    switch(size){
        case [CoffeeSize.SHORT , CoffeeSize.SMALL]:
            println "Youre heath freak"
            break
        case [CoffeeSize.MEDIUM]:
            println "programmer"
            break
        case [CoffeeSize.LARGE]:
            println "Caffeine"
            break
    }



}



orderCoffee(CoffeeSize.SHORT)



for(i in CoffeeSize){
    println i
}
class Man{
    void helpMoveThings(){
        println "Man's helping"
    }
}

class Women{
    void helpMoveThings(){
        println "Women's helping"
    }
}

class Elephant{
    void helpMoveThings(){
        println "Elephant's helping"
    }

    void eatSugarCane(){
        println "i love sugarcane"
    }
}

def takeHelp(helper){
    helper.helpMoveThings()
}

def takeHelpAndReward(helper){
    helper.helpMoveThings()

    if(helper.metaClass.respondsTo(helper , "eatSugarCane")) helper.eatSugarCane()
}




takeHelp(new Elephant())
takeHelp(new Women())
takeHelpAndReward(new Elephant())
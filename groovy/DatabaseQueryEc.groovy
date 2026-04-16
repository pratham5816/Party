
def l = ec.entity.find("automobile.Bike").list();

l.each { b -> 

    println "${b.id}"
}
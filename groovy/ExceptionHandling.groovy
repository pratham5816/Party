
try{
    println 100/0
}catch (Exception e){
    println(e.getCause())
    println(e.getMessage())
}finally {
    println "inside finally"
}

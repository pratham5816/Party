 
//  groovy boolean evaluation. 
String s = null

if(s){                  /// here it different from we cant do this directly | instead s == null 
    println "not null" 
}else{
    println "null"
}


String x = null

println x ? "yes" : "no"

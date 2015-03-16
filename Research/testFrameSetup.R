rowFrame <- data.frame(
    cyl = as.factor("6"),
    disp = as.numeric("160"),
    hp = as.numeric("110"),
    drat = as.numeric("3.90"),
    wt = as.numeric("2.620"),
    qsec = as.numeric("16.46"),
    vs = as.factor("V"),
    am = as.factor("M"),
    gear = as.factor("4"),
    carb = as.factor("4")
)
levels(rowFrame$vs) <- c("S","V")
levels(rowFrame$cyl) <- c(4,6,8)
levels(rowFrame$am) <- c("A","M")
levels(rowFrame$gear) <- c(3,4,5)
levels(rowFrame$carb) <- c(1,2,3,4,6,8)


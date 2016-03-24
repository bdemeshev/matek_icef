library("quantmod") # load data from yahoo/google finance
library("dplyr") # manipulating data frames
library("xts") # working with time series
library("lpSolve") # solving linear programming

# First, read theory!
# http://orfe.princeton.edu/~rvdb/tex/talks/Yale07/lpport_talk.pdf
#


# load APPLE, GOOGLE and MICROSOFT share prices:
getSymbols(Symbols = c("AAPL", "MSFT", "GOOG"),
           from = "2015-01-01", to = "2016-01-01")

head(AAPL)
head(GOOG)
head(MSFT)

# merge in one time series object
all <- merge.xts(AAPL, GOOG, MSFT)

# look at colnames
colnames(all)


# obtain log-revenues
# z_t = log(x_t) - log(x_{t-1})
all1 <- diff(log(all))

# матрица (matrix) - только числа (только текст)
# табличка с данными (data.frame) - каждый столб своего типа
# преобразуем матрицу в таблицу с данными
all2 <- as.data.frame(all1)
glimpse(all2)

# select only adjusted prices
all3 <- dplyr::select(all2, ends_with("Adjusted"))
glimpse(all3)

# omit NA (no NA in our data frame)
R <- na.omit(all3)
glimpse(R)

# example of mean function
v <- c(5, 6, 7)
mean(v)

# calculate mean for each column (2nd dimension):
mu <- apply(R, MARGIN = 2, mean)
mu


T <- nrow(R) # number of observations
K <- ncol(R) # number of shares

T
K

MU <- matrix(rep(mu, T), nrow = T, byrow = TRUE)
head(MU)

D <- R - MU

# identity matrix
I <- diag(T)
I

# bind matrix of constraints
OII <- rbind(rep(0, T), I, -I)
EDD <- rbind(rep(1, K), D, D)
A <- cbind(EDD, OII)

# create RHS for linear programming problem
b <- c(1, rep(0, 2*T))

# user choice of mean/MAD
lambda <- 3

# coefs in goal function
coefs <- c(lambda * mu, rep(-1/T, T))

# directions of constraints
dirs <- c("==", rep(">=", T), rep("<=", T))

# solve LP
result <- lp(direction = "max",
             const.mat = A,
             const.dir = dirs,
             const.rhs = b,
             objective.in = coefs)

# optimal shares of AAPL/GOOG/MSFT
result$solution[1:K]

# further reading
# http://www.rinfinance.com/agenda/2014/workshop/RossBennett.pdf
# http://www.rinfinance.com/RinFinance2009/presentations/yollin_slides.pdf
# https://cran.r-project.org/web/packages/PortfolioAnalytics/vignettes/portfolio_vignette.pdf



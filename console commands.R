#and now the real tests
# copy these in the console
#test 1
set.seed(1110201)
r = rnorm(1000000)
mata = matrix(r, nrow=1000, ncol=1000)
inv_mat_test_frame(mata)


#test 2
set.seed(1201)
r = rnorm(100)
matb = matrix(r, nrow=10, ncol=10)
inv_mat_test_frame(matb)

#test 3
set.seed(1201121)
r = rnorm(10000)
matc = matrix(r, nrow=100, ncol=100)
inv_mat_test_frame(matc)

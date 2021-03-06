library("testthat")
library("txvis")

context('Stored data objects look the way we want them to.')
test_that('Are treats and events right?',
       {
         expect_is(object = treat, "data.frame")
         expect_is(object = events, "data.frame")
         expect_equivalent(colnames(treat), 
                           c("pat_id", "treatment", "class", "sequence", "start", "end"))
         expect_equivalent(colnames(events), 
                           c("pat_id", "event", "start", "end"))
         expect_is(events$pat_id, "character")
         expect_is(events$start, "character")
         expect_is(events$start, "character")
         expect_is(events$end, "character")
         expect_is(treat$end, "character")
         expect_is(treat$start, "character")
         expect_true(!is.na(format(treat$start[1], format = "%d%b%Y")))
         expect_true(!is.na(format(events$start[1], format = "%d%b%Y")))
       })

context('Is the class creation working:')
test_that('What makes it, what breaks it:',
          {
            
          })




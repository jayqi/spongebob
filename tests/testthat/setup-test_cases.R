# Set up test cases for each S3 method

testList <- list(
    list(method = "tospongebob.character"
         , input = list(
             string = "spongebob squarepants"
             , vector = c(
                 "who lives in a pineapple under the sea"
                 , "spongebob squarepants"
             )
             , named_vector = c(
                 cashier = "squidward"
                 , cook = "spongebob"
             )
         )
    )
    , list(method = "tospongebob.default"
           , input = list(
               named_list = list(
                    spongebob = list(
                        episodes = c("Help Wanted", "Reef Blower", "Tea at the Treedome"),
                        characters = c("SpongeBob", "Patrick", "Squidward", "Sandy")
                    ),
                    hey_arnold = list(
                        episodes = c("Downtown as Fruits", "Eugene's Bike"),
                        characters = c("Arnold", "Gerald", "Helga")
                    )
               ) # /named_list
               , unnamed_list = list(
                   list("krusty crab", "chum bucket")
                   , c(1,2,3)
                   , c("krabby patty", "chum")
               ) # /unnamed_list
           ) # /input
    )
    , list(method = "tospongebob.data.frame"
           , input = list(
               mtcars = datasets::mtcars
               , CO2 = datasets::CO2
           )
    )
    , list(method = "tospongebob.factor"
           , input = list(
               datasets::state.region
           )
    )
    , list(method = "tospongebob.fortune"
           , input = list(
               no_context = fortunes::fortune(15)
               , with_context = fortunes::fortune(275)
           )
    )
    , list(method = "tospongebob.function"
           , input = list(
               func1 = vapply
           )
    )
    , list(method = "tospongebob.ggplot"
           , input = list(
               with_legend = {(ggplot2::ggplot(datasets::CO2)
                              + ggplot2::geom_boxplot(ggplot2::aes_string("Treatment", "conc"))
               )} # / with_legend
           )
    )
)

shinyUI(pageWithSidebar(
    headerPanel("Predicting Murder Rate in 1977"),
    sidebarPanel(
        p("Please enter the illiteracy rate you are curious about in the slider below",
          "The output represents the predicted outcome of murder rate given the \"state.x77\"",
          "datasets package in R, using the randomForest algorithm in caret"),
        sliderInput('illiteracy_rate', 'Provide an illiteracy rate', value = .0, min = 0, max = 5, step = 0.1,)
    ),
    mainPanel(
        h1('You entered'),
        verbatimTextOutput("illiteracy_rate"),
        h1('This illiteracy rate would predict a murder rate of'),
        verbatimTextOutput("murder_rate")
    )
))

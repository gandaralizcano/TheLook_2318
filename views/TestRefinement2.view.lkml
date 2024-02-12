include: "/views/TestRefinement.view.lkml"
view: +testrefinement {
  parameter: test {
    allowed_value: {
      value: "sample_value_1"
      label: "My Value from the Refined view"
    }
  }

 }

module ResultsHelper

  def output_result(result)
    if result.successful?
      html_str = "You passed the test!<br> 
                  Your result is 
                  <div class = 'done'>" 
    else 
      html_str = " You failed the test!<br> 
                  Your result is 
                  <div class = 'failure'>"
    end
    html_str.concat(result.percentage_result.to_s, "<\/div>",  " %").html_safe
  end
end

module ResultsHelper

  def output_result(result)
    if result.percentage_result <= 85 
      html_str = " You failed the test!<br> 
                  Your result is 
                  <div class = 'failure'>"
    else 
      html_str = "You passed the test!<br> 
                  Your result is 
                  <div class = 'done'>" 
    end
    html_str.concat(result.percentage_result.to_s, "<\/div>",  " %").html_safe
  end
end

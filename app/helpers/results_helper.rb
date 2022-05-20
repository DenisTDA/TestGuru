module ResultsHelper
  def output_result(result)
    html_str = if result.successful?
                 "You passed the test!<br>
                 Your result is <div class = 'text-success' style = 'display: inline-block'>"
               else
                 " You failed the test!<br>
                  Your result is <div class = 'text-danger' style = 'display: inline-block'>"
               end
    html_str.concat(result.percentage_result.to_s, "<\/div>", ' %').html_safe
  end

  def get_progress(result)
    (result.number_question - 1) * 100 / result.test.questions.count
  end
end

module Screens
  def main_screen
    @main_screen ||= MainScreen.new
  end

  class MainScreen < TestEvolve::Core::MobileAppScreenObject
    element(:number_of_presses_text_input) { { accessibility_id: 'button-clicks-text' } }
    element(:example_button) { { accessibility_id: 'example-button' } }
    element(:alert_message) { { id: 'android:id/alertTitle' } }
    element(:section) { |section_id| { accessibility_id: section_id } }

    def scroll_to_section(section_id)
      scroll_to(section(section_id))
    end

    def retrieve_alert_message_text
      alert_message.text
    end

    def press_example_button_multiple_ways
      # Find element using a page object element
      action.click(example_button).perform
      number_of_presses_text = number_of_presses_text_input
      sleep 1
      raise('Example button text was not updated correctly.') if number_of_presses_text.text != 'The example button has been pressed 1 times.'

      # Find element by XPath using the MobileAppScreenObject
      number_of_presses_text = find_element(:accessibility_id, 'button-clicks-text')
      example_button = find_element(:xpath, '//*[@text="Example Button"]')
      action.click(example_button).perform
      sleep 1
      raise('Example button text was not updated correctly.') if number_of_presses_text.text != 'The example button has been pressed 2 times.'

      # Find element by AccessibilityId using testEvolve.mobileApp
      example_button = TestEvolve.mobile_app.find_element(:accessibility_id, 'example-button')
      TestEvolve.mobile_app.action.click(example_button).perform
      number_of_presses_text = TestEvolve.mobile_app.find_element(:accessibility_id, 'button-clicks-text')
      sleep 1
      return unless number_of_presses_text.text != 'The example button has been pressed 3 times.'
      raise('Example button text was not updated correctly.')
    end

    def press_alert_trigger_button
      alert_trigger_button = find_element(:accessibility_id, 'alert-trigger-button')
      action.click(alert_trigger_button).perform
    end

    def submit_text(text_to_enter)
      find_element(:accessibility_id, 'example-textinput')
      example_text_input = find_element(:accessibility_id, 'example-textinput')
      example_text_input.type(text_to_enter)
      text_input_submit_button = find_element(:accessibility_id, 'textinput-submit')
      action.click(text_input_submit_button).perform
    end

    def verify_submitted_text(expected_text)
      displayed_text_element = find_element(:accessibility_id, 'textinput-update-text')
      actual_text = displayed_text_element.text
      raise("Actual text was '#{actual_text}' not '#{expected_text}'") if actual_text != expected_text
    end

    def scroll_to(element)
      # TODO: update to use w3c actions http://appium.io/docs/en/commands/interactions/actions/
      screen = window_size
      Appium::Core::TouchAction.new(TestEvolve.mobile_app).swipe(start_x: (screen.width / 2),
                                                                 start_y: element.location.y,
                                                                 end_x: (screen.width / 2),
                                                                 end_y: (screen.height / 2)).perform
    end
  end
end

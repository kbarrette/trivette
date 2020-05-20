# trivette [![kbarrettte](https://circleci.com/gh/kbarrette/trivette.svg?style=svg)](https://circleci.com/gh/kbarrette/trivette)
Run [Sidekiq](https://sidekiq.org/) jobs in sequence

![Trivette](https://user-images.githubusercontent.com/896780/82163664-a206ad00-987a-11ea-91b4-22fb8bf845f0.jpg)

*Note: this tool works for my specific needs, and isn't intended to be
"one size fits all."*

## Usage
Create workflow steps that look like this:

```ruby
class YourStep
  include Trivette::Worker

  def execute(arg1, arg2, arg3);
    # your code here
  end
end

class YourNextStep
  include Trivette::Worker
  def execute(arg1, arg2, arg3);
    # your code here
  end
end
```

Then tell Trivette to run the steps in whatever order you want:

```ruby
Trivette.execute(
  [YourStep, YourNextStep],
  'arg one', 'arg two', 'arg three'
)
```

# Notes:
* `Trivette::Worker` includes `Sidekiq::Worker`. Any configuration that would
  normally work there should work in your steps. Any limitations that
  apply to Sidekiq jobs will apply to your step.
* The method name `#execute` may not be ideal, but it avoids stepping on the
  toes of the proprietary code this is mean to live alongside.
* Your steps will all be passed the same args, and all the usual Sidkiq
  argument limitations apply.

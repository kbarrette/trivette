# trivette
Run [Sidekiq](https://sidekiq.org/) jobs in sequence

![Trivette](https://user-images.githubusercontent.com/896780/82163664-a206ad00-987a-11ea-91b4-22fb8bf845f0.jpg)

*Note: this tool works for my specific needs, and isn't intended to be
"one size fits all."*

## Usage
Create workflow steps that look like this:

```ruby
class YourStep < Trivette::Worker
  def run(arg1, arg2, arg3);
    # your code here
  end
end

class YourNextStep < Trivette::Worker
  def run(arg1, arg2, arg3);
    # your code here
  end
end
```

Then tell Trivette to run the steps in whatever order you want:

```ruby
Trivette.run(
  [YourStep, YourNextStep],
  'arg one', 'arg two', 'arg three'
)
```

# Notes:
* `Trivette::Worker` is a basic Sidekiq job. Any configuration that would
  normally work there should work in your steps. Any limitations that
  apply to Sidekiq jobs will apply to your step.
* Your steps will all be passed the same args, and all the usual Sidkiq
  argument limitations apply

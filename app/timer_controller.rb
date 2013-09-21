class TimerController < UIViewController
  attr_reader :timer
  @@duration = 0

  def viewDidLoad
    image = UIImage.imageNamed (".jpg")
    @image_view = UIImageView.alloc.initWithImage(image)
    @image_view.frame = CGRectMake(0, 0, 320, 480)
    view.addSubview(@image_view)
    margin = 20

    @white_view  = UIView.new
    @white_view.frame = [[view.frame.size.width / 2 - margin * 4, 200], [170, 40]]
    @white_view.backgroundColor = UIColor.whiteColor
    view.addSubview(@white_view)

    @state = UILabel.new
    @state.font = UIFont.systemFontOfSize(30)
    @state.text = 'Tap to start'
    @state.textAlignment = UITextAlignmentCenter
    @state.textColor = UIColor.magentaColor
    @state.shadowColor = UIColor.blackColor
    @state.shadowOffset = CGSizeMake(1, 1);
    @state.backgroundColor = UIColor.clearColor
    @state.frame = [[margin, 200], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@state)

    @action_fire = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action_fire.setTitle('Start', forState:UIControlStateNormal)
    @action_fire.setTitle('Stop', forState:UIControlStateSelected)
    @action_fire.addTarget(self, action:'actionTappedFire', forControlEvents:UIControlEventTouchUpInside)
    @action_fire.frame = [[margin, 260], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@action_fire)

    @action_reset = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action_reset.setTitle('Reset', forState:UIControlStateNormal)
    @action_reset.addTarget(self, action:'actionTappedReset', forControlEvents:UIControlEventTouchUpInside)
    @action_reset.frame = [[margin, 340], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@action_reset)
  end

  def actionTappedFire
    if @timer
      @timer.invalidate
      @timer = nil
    else
      @timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:'timerFired', userInfo:nil, repeats:true)
    end
    @action_fire.selected = !@action_fire.selected?
  end

  def timerFired
    @state.text = "%.1f" % (@@duration += 0.1)
  end

  def actionTappedReset
    if @timer
      @timer.invalidate
      @timer = nil
    else
      timerReset
    end
  end

  def timerReset
    @@duration = 0
    @state.text = 'Tap to start'
  end
end

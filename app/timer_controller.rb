class TimerController < UIViewController
  attr_reader :timer
  @@duration = 0

  def viewDidLoad
    hoge_image = UIImage.imageNamed (".jpg")
    @image_view = UIImageView.alloc.initWithImage(hoge_image)
    @image_view.frame = CGRectMake(0, 0, 320, 480)
    view.addSubview(@image_view)
    margin = 20

    @white_view  = UIView.new
    @white_view.frame = [[view.frame.size.width / 2 - margin * 4, 200], [170, 40]]
    @white_view.backgroundColor = UIColor.whiteColor
    view.addSubview(@white_view)

    @state1 = UILabel.new
    @state1.font = UIFont.systemFontOfSize(30)
    @state1.text = 'Tap to start'
    @state1.textAlignment = UITextAlignmentCenter
    @state1.textColor = UIColor.magentaColor
    @state1.shadowColor = UIColor.blackColor
    @state1.shadowOffset = CGSizeMake(1, 1);
    @state1.backgroundColor = UIColor.clearColor
    @state1.frame = [[margin, 200], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@state1)

    @action1 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action1.setTitle('Start', forState:UIControlStateNormal)
    @action1.setTitle('Stop', forState:UIControlStateSelected)
    @action1.addTarget(self, action:'actionTapped1', forControlEvents:UIControlEventTouchUpInside)
    @action1.frame = [[margin, 260], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@action1)

    @action2 = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action2.setTitle('Reset', forState:UIControlStateNormal)
    @action2.addTarget(self, action:'actionTapped2', forControlEvents:UIControlEventTouchUpInside)
    @action2.frame = [[margin, 340], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@action2)
  end

  def actionTapped1
    if @timer
      @timer.invalidate
      @timer = nil
    else
      @timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:'timerFired', userInfo:nil, repeats:true)
    end
    @action1.selected = !@action1.selected?
  end

  def timerFired
    @state1.text = "%.1f" % (@@duration += 0.1)
  end

  def actionTapped2
    if @timer
      @timer.invalidate
      @timer = nil
    else
      timerReset
    end
  end

  def timerReset
    @@duration = 0
    @state1.text = "%.1f" % (@@duration)
  end
end

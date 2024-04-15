<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Lesson Assigned</title>
</head>
<body style="font-family: 'Arial', sans-serif; background-color: #f4f4f4; color: #333;">

    <div style="padding: 15px 0">
        <div style="max-width:600px; margin: 10px auto; display:flex; height: 100px">
            <img style="width: 150px; margin: auto" src="{{ asset('images/ActivityHub_Logo_Main_250W.png') }}" alt="Activity Hub Logo">
        </div>
        <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            
            <div id="header-box" style="border-bottom: 1px solid lightgrey; margin-bottom: 1rem;">
            <h2 style="color: #3B6580; margin-top: 2rem; text-align: center; font-size: 1.5rem;">A New Lesson Has Been Assigned To You!</h2>
            </div>

            <p>Hi {{ $lesson['tutor']['first_name'] }},</p>
            <p>A new lesson has been assigned to you at {{$lesson['school']['name']}}.</p>
            <br>
            <h3>Lesson Details:</h3>
            <div class="lesson-info">
                <h4>Student:</h4><span>{{ $lesson['student']['full_name']}}</span>
            </div>
            <div class="lesson-info">
                <h4>Instrument:</h4><span>{{ $lesson['attributes']['instrument']}}</span>
            </div>
            @if($lesson['attributes']['funding_type'])
                <div class="lesson-info">
                    <h4>Funding:</h4><span>{{ $lesson['attributes']['funding_type']}}</span>
                </div>
            @endif
            <br>
            <p><a href="https://activityhub.co.nz/user-login">Log in</a> to finish setting up this lesson. 
            Or contact {{$lesson['school']['name']}} if you have any questions.</p>
            <p>Kind regards,
            <br>
            The Activity Hub Team.
            </p>
        </div>
    </div>

</body>
</html>

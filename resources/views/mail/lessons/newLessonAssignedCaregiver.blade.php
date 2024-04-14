<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{$lesson['attributes']['instrument']}} Lesson Assigned To Tutor</title>
</head>
<body style="font-family: 'Arial', sans-serif; background-color: #f4f4f4; color: #333;">

    <div style="padding: 15px 0">
        <div style="max-width:600px; margin: 10px auto; display:flex; height: 100px">
            <img style="width: 150px; margin: auto" src="{{ asset('images/ActivityHub_Logo_Main_250W.png') }}" alt="Activity Hub Logo">
        </div>
        <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            
            <div id="header-box" style="border-bottom: 1px solid lightgrey; margin-bottom: 1rem;">
            <h2 style="color: #3B6580; margin-top: 2rem; text-align: center; font-size: 1.5rem;">{{$lesson['attributes']['instrument']}} Lesson Assigned To Tutor.</h2>
            </div>

            <p>Hi {{ $lesson['student']['contacts']['pc']['name'] }},</p>
            <p>Your request for {{ $lesson['student']['first_name']}}'s {{$lesson['attributes']['instrument']}} lessons at {{$lesson['school']['name']}} has been reviewed and sent to a tutor.</p>
            <p>They will be in contact with you to arrange further lesson details.</p>
            <br>
            <h3>Reviewed Lesson:</h3>
            <h4>Student:</h4><p>{{ $lesson['student']['full_name']}}</p>
            <h4>Instrument:</h4><p>{{ $lesson['attributes']['instrument']}}</p>
            <h4>Tutor:</h4><p>{{ $lesson['tutor']['full_name']}}</p>
            <br>
            <p>If you have any questions, please direct them to {{$lesson['school']['name']}}.</p>
            <p>Kind regards,
            <br>
            The Activity Hub Team.
            </p>
        </div>
    </div>

</body>
</html>

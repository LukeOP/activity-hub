<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Lesson Request Has Been Sent</title>
</head>
<body style="font-family: 'Arial', sans-serif; background-color: #f4f4f4; color: #333;">

    <div style="padding: 15px 0">
        <div style="max-width:600px; margin: 10px auto; display:flex; height: 100px">
            {{-- <img style="width: 150px; margin-left: 10px" src="{{ asset('images/ActivityHub_Logo_Main_250W.png') }}" alt="Activity Hub Logo"> --}}
            <img style="width: 150px; margin: auto" src="{{ asset('images/ActivityHub_Logo_Main_250W.png') }}" alt="Activity Hub Logo">
        </div>
        <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            
            <div id="header-box" style="border-bottom: 1px solid lightgrey; margin-bottom: 1rem;">
            <h2 style="color: #3B6580; margin-top: 2rem; text-align: center; font-size: 1.5rem;">Your Lesson Request Has Been Sent!</h2>
            </div>

            <p>Hi {{$data['parent']['name']}},</p>
            <p>Your request for {{$data['student']['name']}}'s {{$data['attributes']['requested_instrument']}} lessons has been successfully sent to {{$data['school']['name']}} to be processed. </p>
            <p>If you have any questions, make sure to follow up with them directly.</p>
            <p>Kind regards,
            <br>
            The Activity Hub Team.
            </p>
        </div>
    </div>

</body>
</html>

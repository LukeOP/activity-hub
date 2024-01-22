<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New User Linked With Your School</title>
</head>
<body style="font-family: 'Arial', sans-serif; background-color: #f4f4f4; color: #333;">

    <div style="padding: 15px 0">
        <div style="max-width:600px; margin: 10px auto; display:flex; height: 100px">
            <img style="width: 150px; margin-left: 10px" src="{{ asset('images/ActivityHub_Logo_Main_250W.png') }}" alt="Activity Hub Logo">
        </div>
        <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            
            <div id="header-box" style="border-bottom: 1px solid lightgrey; margin-bottom: 1rem;">
            <h2 style="color: #3B6580; margin-top: 2rem; text-align: center; font-size: 1.5rem;">A New User Has Linked With Your School!</h2>
            </div>

            <p>Hi {{$user->first_name}}!</p>
            <p>{{ $linkedUser->first_name }} {{ $linkedUser->last_name}} has just joined the staff of {{ $school->name }} under the following reference:</p>
            <h3>Reference: {{ $invitation->reference }}</h3>
            <h3>Email: {{ $invitation->email }}</h3>
            <p>They are all ready to have permissions set for them and you can do this is the 'Staff' area.</p>
            <p>Regards,
            <br>
            The Activity Hub Team.
            </p>
        </div>
    </div>

</body>
</html>

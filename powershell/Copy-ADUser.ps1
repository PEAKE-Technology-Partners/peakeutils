param([string]$UserToCopy, [string]$NewUserName, [string]$NewUserFullName, [string]$NewUserPassword)
$samaccount_to_copy = $UserToCopy
$new_samaccountname = $NewUserName
$new_displayname = $NewUserFullName
$new_firstname = $($new_displayname -split " ")[0]
$new_lastname = $($new_displayname -split " ")[1]
$new_name = $new_displayname

$new_password = $NewUserPassword
$new_description = ''

$enable_user_after_creation = $true
$password_never_expires = $false
$cannot_change_password = $false


$ad_account_to_copy = Get-Aduser $samaccount_to_copy -Properties MemberOf
$new_user_logon_name = "$new_samaccountname@$($ad_account_to_copy.Split('@')[1])"
$new_ou_DN = $ad_account_to_copy.DistinguishedName.Split(',', 2)[1]

$params = @{'SamAccountName' = $new_samaccountname;
            'Instance' = $ad_account_to_copy;
            'DisplayName' = $new_displayname;
            'GivenName' = $new_firstname;
            'SurName' = $new_lastname;
            'PasswordNeverExpires' = $password_never_expires;
            'CannotChangePassword' = $cannot_change_password;
            'Description' = $new_description;
            'Enabled' = $enable_user_after_creation;
            'UserPrincipalName' = $new_user_logon_name;
            'AccountPassword' = (ConvertTo-SecureString -AsPlainText $new_password -Force);
            }

## Create the new user account
New-ADUser -Name $new_name @params

## Mirror all the groups the original account was a member of
$ad_account_to_copy.Memberof | % {Add-ADGroupMember $_ $new_samaccountname }

## Move the new user account into the assigned OU
$newAdUser = Get-ADUser $new_samaccountname 
Set-ADUser -Identity $newAdUser.SamAccountName -ChangePasswordAtLogon $true
$newAdUser | Move-ADObject -TargetPath $new_ou_DN

Write-Host "Created User"
$newAdUser
switch($args[0])
{

--users
{
    Get-LocalUser
    break
}

--sessions
{
    query user /server:$SERVER
    break
}

--processes
{
    try
        {
            $owners = @{}
gwmi win32_process |% {$owners[$_.handle] = $_.getowner().user}

get-process | select processname,Id,@{l="Owner";e={$owners[$_.id.tostring()]}}
        }
     catch
        {
             Write-Host Users flag are not specified
        }
}

Get-Help
{
    Write-Host '
--users: Display all users on your desctop (UserAccounts)
--sessions - display all active sessions on local computer
--processes - [ACCEPTABLE ONLY IF USERS FLAG SPECIFIED] get processes runned by --users
               '
}
Default
    {
        Write-Host Something went wrong. Call the Get-Help command
    }
}
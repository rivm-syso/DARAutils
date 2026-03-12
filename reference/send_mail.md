# Send mail

Sends an automated e-mail. Can be useful after running your pipeline,
e.g. succes or failure.

## Usage

``` r
send_mail(
  subject,
  body,
  recipients,
  is.html = FALSE,
  sender = "noreply@domain.nl",
  attachments = NULL,
  cc = NULL,
  bcc = NULL
)
```

## Arguments

- subject:

  Character. Subject of email.

- body:

  Character. Body of email.

- recipients:

  List of characters. Mail addresses of recipients.

- is.html:

  Boolean. Should content type of email be html?

- sender:

  Character. Sender of email.

- attachments:

  Vector of characters. Paths to attachments.

- cc:

  Character. CC mail addresses.

- bcc:

  Character. BCC mail addresses.

## Examples

``` r
if (FALSE) { # \dontrun{
send_mail(
  subject = "Test mail",
  body = "This is a test e-mail",
  recipients = "hello[@]example.com"
)
} # }
```

#' Send mail
#'
#' @description
#' Sends an automated e-mail. Can be useful after running your pipeline,
#' e.g. succes or failure.
#'
#' @param subject Character. Subject of email.
#' @param body Character. Body of email.
#' @param recipients List of characters. Mail addresses of recipients.
#' @param is.html Boolean. Should content type of email be html?
#' @param sender Character. Sender of email.
#' @param attachments Vector of characters. Paths to attachments.
#' @param cc Character. CC mail addresses.
#' @param bcc Character. BCC mail addresses.
#'
#' @examples
#' \dontrun{
#' send_mail(
#'   subject = "Test mail",
#'   body = "This is a test e-mail",
#'   recipients = "hello[@]example.com"
#' )
#' }
#'
#' @export
send_mail <- function(subject, body, recipients,
                      is.html = FALSE, sender = "noreply@insert_institute.nl",
                      attachments = NULL, cc = NULL, bcc = NULL) {
  check_installed("sendmailR")
  msg1 <- sendmailR::mime_part(body)
  if (is.html) {
    msg1$headers$`Content-Type` <- "text/html"
  }

  msg <- c(list(msg1), map(attachments, sendmailR::mime_part))

  # Spaces not allowed
  sender <- str_replace_all(sender, " ", "")

  e <- sendmailR::sendmail(
    from = sender,
    to = recipients,
    subject = subject,
    msg = msg,
    cc = cc,
    bcc = bcc
  )

  invisible(NULL)
}

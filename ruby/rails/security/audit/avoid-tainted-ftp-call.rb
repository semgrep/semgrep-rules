require 'net/ftp'

def foo

  host = params[:host]
  # ruleid: avoid-tainted-ftp-call
  ftp = Net::FTP.new(host)

  # ruleid: avoid-tainted-ftp-call
  ftp = Net::FTP.open(params[:host])

  ftp = Net::FTP.new()
  # ruleid: avoid-tainted-ftp-call
  ftp.connect(params[:host])

  # ruleid: avoid-tainted-ftp-call
  ftp.get("/tmp/#{params[:file]}")

  # ruleid: avoid-tainted-ftp-call
  ftp.getbinaryfile("/tmp/#{params[:file]}")

  # ruleid: avoid-tainted-ftp-call
  ftp.gettextfile("/tmp/#{params[:file]}")

  # ruleid: avoid-tainted-ftp-call
  ftp.put("/tmp/#{params[:file]}")

  # ruleid: avoid-tainted-ftp-call
  ftp.putbinaryfile("/tmp/#{params[:file]}")

  # ruleid: avoid-tainted-ftp-call
  ftp.puttextfile("/tmp/#{params[:file]}")

  # ruleid: avoid-tainted-ftp-call
  ftp.delete("/tmp/#{params[:file]}")

  # ruleid: avoid-tainted-ftp-call
  ftp.storlines(params[:cmd], "/tmp/log")

  # ruleid: avoid-tainted-ftp-call
  ftp.storbinary(params[:cmd], "/tmp/log")

  # ruleid: avoid-tainted-ftp-call
  ftp.sendcmd(params[:cmd])

  # ruleid: avoid-tainted-ftp-call
  ftp.retrlines(params[:cmd])

  # ruleid: avoid-tainted-ftp-call
  ftp.retrbinary(params[:cmd], 1024)

  # ok: avoid-tainted-ftp-call
  ftp = Net::FTP.new("example.com")

  # ok: avoid-tainted-ftp-call
  ftp = Net::FTP.open("example.com")

  ftp = Net::FTP.new()
  # ok: avoid-tainted-ftp-call
  ftp.connect("example.com")

  # ok: avoid-tainted-ftp-call
  ftp.get("/tmp/file")

  # ok: avoid-tainted-ftp-call
  ftp.getbinaryfile("/tmp/file")

  # ok: avoid-tainted-ftp-call
  ftp.gettextfile("/tmp/file")

  # ok: avoid-tainted-ftp-call
  ftp.put("/tmp/file")

  # ok: avoid-tainted-ftp-call
  ftp.putbinaryfile("/tmp/file")

  # ok: avoid-tainted-ftp-call
  ftp.puttextfile("/tmp/file")

  # ok: avoid-tainted-ftp-call
  ftp.delete("/tmp/file")

  # ok: avoid-tainted-ftp-call
  ftp.storlines("ls -al", "/tmp/log")

  # ok: avoid-tainted-ftp-call
  ftp.storbinary("ls -al", "/tmp/log")

  # ok: avoid-tainted-ftp-call
  ftp.sendcmd("ls -al")

  # ok: avoid-tainted-ftp-call
  ftp.retrlines("ls -al")

end

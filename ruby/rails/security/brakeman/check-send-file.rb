def test_send_file
    # ruleid: check-send-file
    send_file params[:file]
end

def test_send_file2
    # ruleid: check-send-file
    send_file cookies[:something]
end

def test_send_file3
    # ruleid: check-send-file
    send_file cookies.permanent[:something]
end

def test_send_file4
    # ruleid: check-send-file
    send_file cookies.permanent[:something]
end

def test_send_file5
    # ok: check-send-file
    send_file cookies.encrypted[:something]
end

def test_send_file6
    # this is reported since semgrep 0.94 because . ... . can now match
    # intermediate fields, not just method calls.
    # ruleid: check-send-file
    send_file cookies.signed.permanent[:something]
end

def test_send_file7
    # ok: check-send-file
    send_file cookies.permanent.signed[:something]
end

def test_send_file8
    # ruleid: check-send-file
    send_file request.env[:badheader]
end

def test_send_file_ok
    # ok: check-send-file
    send_file "some_safe_file.txt"
end

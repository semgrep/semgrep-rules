def foo

    #
    # Test bad open combinations

    # ruleid: avoid-tainted-file-access
    File.open("/tmp/#{params[:name]}")
    # ruleid: avoid-tainted-file-access
    File.open(params[:name])
    # ok: avoid-tainted-file-access
    File.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Dir.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Dir.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    IO.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    IO.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Kernel.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Kernel.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::FTP.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::FTP.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::HTTP.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::HTTP.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    PStore.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    PStore.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Pathname.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Pathname.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Shell.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Shell.open("/tmp/usr/bin")

    #
    # Test bad chdir combinations

    # ruleid: avoid-tainted-file-access
    File.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    File.chdir("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Dir.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Dir.chdir("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    IO.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    IO.chdir("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Kernel.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Kernel.chdir("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::FTP.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::FTP.chdir("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::HTTP.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::HTTP.chdir("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    PStore.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    PStore.chdir("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Pathname.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Pathname.chdir("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Shell.chdir("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Shell.chdir("/tmp/usr/bin")

    #
    # Test bad chroot combinations

    # ruleid: avoid-tainted-file-access
    File.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    File.chroot("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Dir.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Dir.chroot("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    IO.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    IO.chroot("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Kernel.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Kernel.chroot("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::FTP.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::FTP.chroot("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::HTTP.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::HTTP.chroot("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    PStore.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    PStore.chroot("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Pathname.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Pathname.chroot("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Shell.chroot("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Shell.chroot("/tmp/usr/bin")

    #
    # Test bad delete combinations

    # ruleid: avoid-tainted-file-access
    File.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    File.delete("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Dir.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Dir.delete("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    IO.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    IO.delete("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Kernel.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Kernel.delete("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::FTP.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::FTP.delete("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::HTTP.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::HTTP.delete("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    PStore.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    PStore.delete("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Pathname.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Pathname.delete("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Shell.delete("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Shell.delete("/tmp/usr/bin")

    #
    # Test bad lchmod combinations

    # ruleid: avoid-tainted-file-access
    File.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    File.lchmod("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Dir.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Dir.lchmod("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    IO.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    IO.lchmod("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Kernel.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Kernel.lchmod("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::FTP.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::FTP.lchmod("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::HTTP.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::HTTP.lchmod("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    PStore.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    PStore.lchmod("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Pathname.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Pathname.lchmod("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Shell.lchmod("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Shell.lchmod("/tmp/usr/bin")

    #
    # Test bad open combinations

    # ruleid: avoid-tainted-file-access
    File.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    File.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Dir.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Dir.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    IO.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    IO.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Kernel.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Kernel.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::FTP.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::FTP.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::HTTP.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::HTTP.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    PStore.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    PStore.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Pathname.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Pathname.open("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Shell.open("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Shell.open("/tmp/usr/bin")

    #
    # Test bad readlines combinations

    # ruleid: avoid-tainted-file-access
    File.readlines("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    File.readlines("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Dir.readlines("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Dir.readlines("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    IO.readlines("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    IO.readlines("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Kernel.readlines("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Kernel.readlines("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::FTP.readlines("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::FTP.readlines("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    Net::HTTP.readlines("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Net::HTTP.readlines("/tmp/usr/bin")

    # ruleid: avoid-tainted-file-access
    PStore.readlines("/tmp/#{cookies[:name]}")
    # ok: avoid-tainted-file-access
    PStore.readlines("/tmp/#{anything}/bin")

    # ruleid: avoid-tainted-file-access
    Pathname.readlines("/tmp/#{request.env[:name]}")
    # ok: avoid-tainted-file-access
    Pathname.readlines("/tmp/#{anything}/bin")

    # ruleid: avoid-tainted-file-access
    Shell.readlines("/tmp/#{params[:name]}")
    # ok: avoid-tainted-file-access
    Shell.readlines(something_else)


    #
    # Test ok tainted calls

    # ok: avoid-tainted-file-access
    File.basename("/tmp/#{params[:name]}")

end

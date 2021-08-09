def foo

    #
    # Test bad open combinations

    # rule-id: avoid-tained-file-access
    File.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    File.open(user_input)
    # ok: avoid-tained-file-access
    File.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Dir.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Dir.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    IO.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    IO.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Kernel.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Kernel.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::FTP.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Net::FTP.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::HTTP.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Net::HTTP.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    PStore.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    PStore.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Pathname.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Pathname.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Shell.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Shell.open("/tmp/usr/bin")

    #
    # Test bad chdir combinations

    # rule-id: avoid-tained-file-access
    File.chdir("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    File.chdir("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Dir.chdir("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Dir.chdir("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    IO.chdir("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    IO.chdir("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Kernel.chdir("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Kernel.chdir("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::FTP.chdir("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Net::FTP.chdir("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::HTTP.chdir("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Net::HTTP.chdir("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    PStore.chdir("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    PStore.chdir("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Pathname.chdir("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Pathname.chdir("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Shell.chdir("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Shell.chdir("/tmp/usr/bin")

    #
    # Test bad chroot combinations

    # rule-id: avoid-tained-file-access
    File.chroot("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    File.chroot("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Dir.chroot("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Dir.chroot("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    IO.chroot("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    IO.chroot("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Kernel.chroot("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Kernel.chroot("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::FTP.chroot("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Net::FTP.chroot("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::HTTP.chroot("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Net::HTTP.chroot("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    PStore.chroot("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    PStore.chroot("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Pathname.chroot("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Pathname.chroot("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Shell.chroot("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Shell.chroot("/tmp/usr/bin")

    #
    # Test bad delete combinations

    # rule-id: avoid-tained-file-access
    File.delete("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    File.delete("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Dir.delete("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Dir.delete("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    IO.delete("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    IO.delete("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Kernel.delete("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Kernel.delete("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::FTP.delete("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Net::FTP.delete("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::HTTP.delete("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Net::HTTP.delete("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    PStore.delete("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    PStore.delete("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Pathname.delete("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Pathname.delete("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Shell.delete("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Shell.delete("/tmp/usr/bin")

    #
    # Test bad lchmod combinations

    # rule-id: avoid-tained-file-access
    File.lchmod("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    File.lchmod("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Dir.lchmod("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Dir.lchmod("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    IO.lchmod("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    IO.lchmod("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Kernel.lchmod("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Kernel.lchmod("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::FTP.lchmod("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Net::FTP.lchmod("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::HTTP.lchmod("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Net::HTTP.lchmod("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    PStore.lchmod("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    PStore.lchmod("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Pathname.lchmod("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Pathname.lchmod("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Shell.lchmod("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Shell.lchmod("/tmp/usr/bin")

    #
    # Test bad open combinations

    # rule-id: avoid-tained-file-access
    File.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    File.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Dir.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Dir.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    IO.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    IO.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Kernel.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Kernel.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::FTP.open("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Net::FTP.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::HTTP.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Net::HTTP.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    PStore.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    PStore.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Pathname.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Pathname.open("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Shell.open("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Shell.open("/tmp/usr/bin")

    #
    # Test bad readlines combinations

    # rule-id: avoid-tained-file-access
    File.readlines("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    File.readlines("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Dir.readlines("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Dir.readlines("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    IO.readlines("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    IO.readlines("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Kernel.readlines("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Kernel.readlines("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::FTP.readlines("/tmp/#{user_input}")
    # ok: avoid-tained-file-access
    Net::FTP.readlines("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Net::HTTP.readlines("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Net::HTTP.readlines("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    PStore.readlines("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    PStore.readlines("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Pathname.readlines("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Pathname.readlines("/tmp/usr/bin")

    # rule-id: avoid-tained-file-access
    Shell.readlines("/tmp/#{user_input}")
    # rule-id: avoid-tained-file-access
    Shell.readlines("/tmp/usr/bin")


    #
    # Test ok tainted calls

    # ok: avoid-tained-file-access
    File.basename("/tmp/#{user_input}")

end

# fish_prompt.fish for mono-robby theme

function fish_prompt
    # Simpan status dari perintah terakhir
    set -l last_status $status

    # Atur warna prompt berdasarkan status perintah terakhir
    # Sukses (status 0) -> Putih gading
    # Gagal (status non-zero) -> Putih terang dan tebal
    if test $last_status -eq 0
        set_color dddddd
    else
        set_color --bold ffffff
    end

    # Cetak panah prompt
    echo -n '➜ '
    set_color normal

    # Cetak nama direktori saat ini dengan warna abu-abu sedang
    set_color aaaaaa
    echo -n (prompt_pwd)
    set_color normal

    # Cek dan cetak info Git jika ada
    set -l git_info (fish_git_prompt ' (%s)')
    if test -n "$git_info"
        # Info branch Git dengan warna putih gading
        set_color dddddd
        echo -n $git_info
        set_color normal
    end

    echo -n ' '
end

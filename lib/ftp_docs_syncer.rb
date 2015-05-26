require 'net/ftp'

class FTPDocsSyncer

  attr_accessor :ftp

  def initialize
    connect
  end

  def send_version(version)
    if connection_available?
      doc = version.doc
      user = doc.discipline.present? ? doc.discipline.user : doc.user
      cd user.ftp_path
      cd doc.discipline.name
      cd doc.name

      unless ls.map { |f| f.force_encoding('utf-8') }.include? version.path
        @ftp.putbinaryfile [Rails.root, "public", version.download_path].join('/')
      end
    end
  end

  def send_all_info
    if connection_available?
      Version.for_front.each do |v|
        reconnect
        send_version(v)
      end
    end
  end

  def get_all_info
    if connection_available?
      User.for_sync.each do |user|
        p "Start updating disciplines for user_id = #{user.id}"
        reconnect
        update_disciplines_for user
        user.disciplines.each do |discipline|
          p "Start updating docs for discipline_id = #{discipline.id}"
          reconnect
          update_docs_for discipline
          discipline.docs.each do |doc|
            p "Start updating versions for doc_id = #{doc.id}"
            reconnect
            update_versions_for doc
            p "Start updating versions for doc_id = #{doc.id}"
          end
          p "End updating docs for discipline_id = #{discipline.id}"
        end
        p "End updating disciplines for user_id = #{user.id}"
      end
    end
  end

  def update_disciplines_for(user)
    if connection_available?
      cd user.ftp_path
      disciplines = ls
      disciplines.each do |d|
        name = d.force_encoding('utf-8')
        unless user.disciplines.exists?(name: name)
          user.disciplines.create(name: name, description: name)
        end
      end
    end
  rescue
  end

  def update_docs_for(discipline)
    if connection_available?
      cd discipline.user.ftp_path
      cd discipline.name
      docs = ls
      docs.each do |d|
        name = d.force_encoding('utf-8')
        unless discipline.docs.exists?(name: name)
          discipline.docs.create(name: name, user: discipline.user)
        end
      end
    end
  rescue
  end

  def update_versions_for(doc)
    if connection_available?
      cd doc.discipline.user.ftp_path
      cd doc.discipline.name
      cd doc.name
      versions = ls
      versions.each do |d|
        name = d.force_encoding('utf-8')
        if is_file?(name)
          unless doc.versions.exists?(path: name)
            version = doc.versions.create
            file_name = version.file_name(name)
            @ftp.rename name, file_name
            server_file_path = Rails.root.join('public', 'versions', file_name)
            @ftp.getbinaryfile file_name, server_file_path
            version.update path: file_name
          end
        end
      end
    end
  rescue
  end

  def cd(dir)
    begin
      @ftp.mkdir dir
    rescue
    end
    @ftp.chdir dir
  end

  def ls(dir = nil)
    @ftp.nlst dir
  end

  def is_file?(name)
    @ftp.chdir(name)
    ftp.chdir('..')
    false
  rescue
    true
  end

  def reconnect
    disconnect
    connect
  end

  def disconnect
    @ftp.close
  end

  def connect
    crendetials = get_crendetials
    @ftp = Net::FTP.new(crendetials[:server], crendetials[:login], crendetials[:password])
  rescue
    @ftp = nil
  end

  private
  def get_crendetials
    YAML.load_file(Rails.root.join("config", "ftp_crendetials.yml")).symbolize_keys
  end

  def connection_available?
    @ftp.present?
  end

end

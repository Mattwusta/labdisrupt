class ImagesController < ApplicationController
 def serve
    path = "/app/assests/images/path/#{params[:filename]}"

    send_file( path,
      :disposition => 'inline',
      :type => 'image/jpeg',
      :x_sendfile => true )
  end
end
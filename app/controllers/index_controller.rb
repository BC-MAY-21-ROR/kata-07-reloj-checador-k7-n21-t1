class IndexController < ApplicationController
  def index
    # recibimos las variables del formulario
    branch = params[:branch]
    private_number = params[:private_number]

    # obtenemos la fecha y hora actual
    fecha = "#{Time.now.strftime('%Y')}-#{Time.now.strftime('%m')}-#{Time.now.strftime('%e')}"
    hora = "#{Time.now.strftime('%H')}:#{Time.now.strftime('%M')}:#{Time.now.strftime('%S')}"

    # definimos el date_time
    date_time = "#{fecha} #{hora}"

    if private_number != ''
      verify_check_in = Check.find_by(out: nil, employee_id: private_number)
      @otra = verify_check_in
      # verificamos si es check_in o check_out!
      if verify_check_in.nil?
        # es check_in
        if Check.create(entrance: date_time, out: '', employee_id: private_number, created_at: date_time,
                        updated_at: date_time).save
          redirect_to index_path
        else
          # render_to
        end
      else
        # es check_out
        make_check_out = Check.find_by(out: nil, employee_id: private_number)
        make_check_out.out = date_time

        if make_check_out.save
          redirect_to index_path
        else
          # render_to
        end
      end
    end
  end
end

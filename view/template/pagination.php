<nav aria-label="Pagination">
	<ul class="pagination mt-3 mb-0">
	<?php
		if ( $pagination['page'] <= 1 ) :
			echo '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
		else :
			$j = $pagination['page'] - 1;
			echo '<li class="page-item"><a class="page-link" href="?page=' . $j . '&orderby=' . $orderBy . '">Previous</a></li>';
		endif;

		for( $i = 1; $i <= $pagination['total_pages']; $i++ ) :
			if( $i <> $pagination['page'] ) :
				echo '<li class="page-item"><a class="page-link" href="?page='. $i . '&orderby=' . $orderBy . '">' . $i . '</a></li>';
			else :
				echo '<li class="page-item active"><a class="page-link" href="#">' . $i . '</a></li>';
			endif;
		endfor;

		if ( $pagination['page'] == $pagination['total_pages'] ) :
			echo '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
		else :
			$j = $pagination['page'] + 1;
			echo '<li class="page-item"><a class="page-link" href="?page=' . $j . '&orderby=' . $orderBy . '">Next</a></li>';
		endif;
	?>
	</ul>
</nav>

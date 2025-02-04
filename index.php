<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/head.php');?>
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/nav.php');?>
<?php if ($TD->Setting('is-modal') == 1): ?>
    <div class="modal fade" id="notice-home" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-top" role="document">
            <div class="modal-content thanhdieu-card-bg thanhdieu-border-card modalBg">
                <div class="modal-header">
                    <h5 class="modal-title">HƯỚNG DẪN SỬ DỤNG FAKEBILL</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <p><em> Hãy xem video hướng dẫn bên dưới </em></p>
                    <div class="">
                        <video id="player" autoplay="" loop="" playsinline controls
                            data-poster="<?= $options_header['og:image'] ?? ($TD->Setting('og:image') === '' ? '/' . __IMG__ . '/banner.png' : $TD->Setting('og:image')) ?>">
                            <source src="//maisytien.com/nhac.mp4" type="video/mp4" />
                        </video>
                    </div>
                </div>
                <div class="modal-footer">
                    <span>
                        <a class="btn btn-icon infoBox fullscreen" type="button"><svg xmlns="http://www.w3.org/2000/svg"
                                width="16" height="16" fill="currentColor" class="bi bi-arrows-fullscreen"
                                viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M5.828 10.172a.5.5 0 0 0-.707 0l-4.096 4.096V11.5a.5.5 0 0 0-1 0v3.975a.5.5 0 0 0 .5.5H4.5a.5.5 0 0 0 0-1H1.732l4.096-4.096a.5.5 0 0 0 0-.707zm4.344 0a.5.5 0 0 1 .707 0l4.096 4.096V11.5a.5.5 0 1 1 1 0v3.975a.5.5 0 0 1-.5.5H11.5a.5.5 0 0 1 0-1h2.768l-4.096-4.096a.5.5 0 0 1 0-.707zm0-4.344a.5.5 0 0 0 .707 0l4.096-4.096V4.5a.5.5 0 1 0 1 0V.525a.5.5 0 0 0-.5-.5H11.5a.5.5 0 0 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 0 .707zm-4.344 0a.5.5 0 0 1-.707 0L1.025 1.732V4.5a.5.5 0 0 1-1 0V.525a.5.5 0 0 1 .5-.5H4.5a.5.5 0 0 1 0 1H1.732l4.096 4.096a.5.5 0 0 1 0 .707z">
                                </path>
                            </svg></a>
                    </span>
                    <span>
                        <a class="btn thanhdieuButton" data-bs-dismiss="modal" type="button">ĐÓNG</a>
                    </span>
                </div>
            </div>
        </div>
    </div>
<?php endif ?>
<!-- Content wrapper -->
<div class="content-wrapper wt-show-log">
    <!-- Content -->
    <div class="flex-grow-1 container-p-y container-fluid">
        <h4 class="py-3 breadcrumb-wrapper mb-4">
            <span class="text-red-800 fw-light">FakeBill / </span> Trang Chủ
        </h4>
        <!-- <div class="alert alert-primary alert-dismissible" role="alert">
            <h6 class="alert-heading mb-1">📱 Liên Hệ Hỗ Trợ</h6>
            <span>Mọi liên hệ và nạp tiền vui lòng nhấn vào đây: <a class="font-bold"
                    href="<?= $TD->Setting('telegram') ?>">Tại đây</a>.</span>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div> -->
        <div class="row">
            <div class="col-md-7">
                <div class="card card-action mb-4 thanhdieu-card-bg thanhdieu-border-card">
                    <div class="card-header align-items-center">
                        <h5 class="card-action-title mb-0"><i class="ri-notification-line me-2"></i>Tin Mới Nhất</h5>
                    </div>
                    <?php
                    /**
                     * @author maisytien
                     */
                    class BangTin extends DatabaseConnection
                    {
                        public function Show()
                        {
                            $oOo = mysqli_query(self::ThanhDieuDB(), "SELECT * FROM ws_newfeeds WHERE trangthai !=0 ORDER BY ngaydang DESC");
                            if ($oOo) { ?>
                                <div class="card-body newfeeds">
                                    <ol class="timeline ms-2">
                                        <?php
                                        if (mysqli_num_rows($oOo) > 0) {
                                            while ($td = mysqli_fetch_assoc($oOo)) { ?>
                                                <li class="timeline-item timeline-item-transparent">
                                                    <span class="timeline-point timeline-point-<?=($td['loai'])?>"></span>
                                                    <div class="timeline-header mb-1">
                                                        <h6 class="mt-0"><?=THANHDIEU($td['tieude']);?></h6>
                                                        <small class="text-muted"><?=FormatTime::TD($td['ngaydang']); ?></small>
                                                    </div>
                                                    <div class="d-flex flex-wrap">
                                                        <div class="overflow-auto mb-4">
                                                            <?= nl2br($td['noidung']); ?>
                                                        </div>
                                                    </div>
                                                </li>
                                            <?php }
                                        } else { ?>
                                            <li class="timeline-item timeline-item-transparent">
                                                <div class="d-flex flex-wrap">
                                                    <div class="overflow-auto">
                                                    🔴 Chưa có bảng tin nào
                                                    </div>
                                                </div>
                                            </li>
                                        <?php } ?>
                                    </ol>
                                </div>
                                <?php
                            }
                        }
                    }
                    $newfeeds = new BangTin();
                    $newfeeds->Show();
                    ?>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="card card-action mb-4 thanhdieu-card-bg thanhdieu-border-card">
                    <div class="card-header align-items-center">
                        <h5 class="card-action-title mb-0"><i class="ri-menu-2-line me-2"></i>Truy Cập Nhanh</h5>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled mb-0">
                            <li class="mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="d-flex align-items-start">
                                        <div class="avatar me-3">
                                            <img src="/<?= __IMG__ ?>/icon/bank/mbbank2.png" alt="Logo" class="rounded">
                                        </div>
                                        <div class="me-2">
                                            <h6 class="mb-0">Fakebill MBBank</h6>
                                            <small class="text-muted" id="stats-mb">0 Lượt tạo</small>
                                        </div>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="/fake-bill/mb-bank"><span class="badge thanhdieuButton">Tạo ngay
                                                <i class="ri-arrow-right-line"></i></span></a>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="d-flex align-items-start">
                                        <div class="avatar me-3">
                                            <img src="/<?= __IMG__ ?>/icon/bank/vietcombank.png" alt="Logo"
                                                class="rounded">
                                        </div>
                                        <div class="me-2">
                                            <h6 class="mb-0">Fakebill Vietcombank</h6>
                                            <small class="text-muted" id="stats-vcb">0 Lượt tạo</small>
                                        </div>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="/fake-bill/vietcombank"><span class="badge thanhdieuButton">Tạo
                                                ngay <i class="ri-arrow-right-line"></i></span></a>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="d-flex align-items-start">
                                        <div class="avatar me-3">
                                            <img src="/<?= __IMG__ ?>/icon/bank/techcombank.png" alt="Logo"
                                                class="rounded">
                                        </div>
                                        <div class="me-2">
                                            <h6 class="mb-0">Fakebill Techcombank</h6>
                                            <small class="text-muted" id="stats-tcb">0 Lượt tạo</small>
                                        </div>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="/fake-bill/techcombank"><span class="badge thanhdieuButton">Tạo ngay
                                                <i class="ri-arrow-right-line"></i></span></a>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="d-flex align-items-start">
                                        <div class="avatar me-3">
                                            <img src="/<?= __IMG__ ?>/icon/bank/acb.png" alt="Logo" class="rounded">
                                        </div>
                                        <div class="me-2">
                                            <h6 class="mb-0">Fakebill ACB Bank</h6>
                                            <small class="text-muted" id="stats-acb"> 0 Lượt tạo</small>
                                        </div>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="/fake-bill/acb-bank"><span class="badge thanhdieuButton">Tạo ngay <i
                                                    class="ri-arrow-right-line"></i></span></a>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="d-flex align-items-start">
                                        <div class="avatar me-3">
                                            <img src="/<?= __IMG__ ?>/icon/bank/vietinbank.png" alt="Logo"
                                                class="rounded">
                                        </div>
                                        <div class="me-2">
                                            <h6 class="mb-0">Fakebill Vietinbank</h6>
                                            <small class="text-muted" id="stats-ctg">0 Lượt tạo</small>
                                        </div>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="/fake-bill/vietinbank"><span class="badge thanhdieuButton">Tạo ngay <i
                                                    class="ri-arrow-right-line"></i></span></a>
                                    </div>
                                </div>
                            </li>
                            <li class="mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="d-flex align-items-start">
                                        <div class="avatar me-3" style="width:32px;height:32px;margin-left:2.5px;">
                                            <img src="/<?= __IMG__ ?>/icon/bank/msb.png" alt="Logo" class="rounded">
                                        </div>
                                        <div class="me-2">
                                            <h6 class="mb-0">Fakebill MSB</h6>
                                            <small class="text-muted" id="stats-msb">0 Lượt tạo</small>
                                        </div>
                                    </div>
                                    <div class="ms-auto">
                                        <a href="/fake-bill/msb"><span class="badge thanhdieuButton">Tạo ngay
                                                <i class="ri-arrow-right-line"></i></span></a>
                                    </div>
                                </div>
                            </li>
                            <li class="text-center">
                                <a class="text-red-800" href="/fake-bill-chuyen-khoan">Xem tất cả bank</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <section class="mt-4 section-py landing-fun-facts">
            <div class="container2">
                <div class="row gy-3">
                    <div class="col-md-3 mb-md-0 mb-4">
                        <div class="card thanhdieu-card-bg thanhdieu-border-card">
                            <div class="card-body text-center">
                                <img class="mb-4" src="/<?= __IMG__ ?>/icon/front-pages/an-toan.png" height="52"
                                    alt="Help center articles">
                                <h5>Độ An Toàn Cao</h5>
                                <p>Chúng tôi tự tin là một trong những dịch vụ an toàn nhất hiện có.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-md-0 mb-4">
                        <div class="card thanhdieu-card-bg thanhdieu-border-card">
                            <div class="card-body text-center">
                                <img class="mb-4" src="/<?= __IMG__ ?>/icon/front-pages/uy-tin.png" height="52"
                                    alt="Help center articles">
                                <h5>Dịch Vụ Uy Tín</h5>
                                <p>Châm ngôn của nền tảng chúng tôi là luôn đặt uy tín lên hàng đầu.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-md-0 mb-4">
                        <div class="card thanhdieu-card-bg thanhdieu-border-card">
                            <div class="card-body text-center">
                                <img class="mb-4" src="/<?= __IMG__ ?>/icon/front-pages/toc-do.png" height="52"
                                    alt="Help center articles">
                                <h5>Xử Lý Nhanh</h5>
                                <p>Với hệ thống hoàn toàn tự động, đảm bảo tốc độ xử lý tốc độ cao.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-md-0 mb-4">
                        <div class="card thanhdieu-card-bg thanhdieu-border-card">
                            <div class="card-body text-center">
                                <img class="mb-4" src="/<?= __IMG__ ?>/icon/front-pages/ho-tro.png" height="52"
                                    alt="Help center articles">
                                <h5>Hỗ Trợ 24/7</h5>
                                <p>Đội ngũ nhân viên hỗ trợ online mọi lúc, mọi nơi 24/7 kể cả ngày lễ.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<!-- / Content -->
<?php require_once($_SERVER['DOCUMENT_ROOT'] . '/include/foot.php'); ?>